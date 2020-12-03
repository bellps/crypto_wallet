module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end

    def nome_aplicacao
        "Crypto Wallet App"
    end

    def ambiente_rails
        case Rails.env
        when "development"
            "desenvolvimento"

        when "production"
            "produção"
            
        else
            "teste"
        end
    end
end
