# task personalizada
namespace :dev do
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
        if Rails.env.development?
            show_spinner("Apagando BD...") { %x(rails db:drop) } # %x() executa um comando de terminar
            show_spinner("Criando BD...") { %x(rails db:create) }
            show_spinner("Migrando BD...") { %x(rails db:migrate) }
            show_spinner("Cadastrando tipos de mineração...") { %x(rails dev:add_mining_types) }
            show_spinner("Populando moedas...") { %x(rails dev:add_coins) }
        else
            puts "Você não está em ambiente de desenvolvimento!"
        end
    end

    desc "Cadastra moedas"
    task add_coins: :environment do
        coins = [
            {
                description: "Bitcoin", 
                acronym: "BTC",
                url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png",
                mining_type: MiningType.find_by(acronym: 'PoW') #procura qual tipo tem a sigla Pow e associa o id dele à moeda
                # se for procurar por id, usar o .find()
            },
            {
                description: "Ethereum", 
                acronym: "ETH",
                url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/628px-Ethereum_logo_2014.svg.png",
                mining_type: MiningType.all.sample #sorteia um tipo aleatório
            },
            {
                description: "Dash", 
                acronym: "DASH",
                url_image: "https://media.dash.org/wp-content/uploads/Dash-D-white_on_blue_circle.png",
                mining_type: MiningType.all.sample
            }
        ]
        
        coins.each do |coin|
            Coin.find_or_create_by!(coin)
        end

    end

    desc "Cadastro dos Tipos de Mineração"
    task add_mining_types: :environment do
        mining_types = [
            {description: "Proof of Work", acronym: "PoW"},
            {description: "Proof of Stake", acronym: "PoS"},
            {description: "Proof of Capacity", acronym: "PoC"}
        ]

        mining_types.each do |type|
            MiningType.find_or_create_by!(type)
        end  
    end

    private
    def show_spinner(msg_start, msg_end = '(Prontinho!)')
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :arc)
        spinner.auto_spin
        yield
        spinner.success(msg_end)
    end
end