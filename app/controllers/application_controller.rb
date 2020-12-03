class ApplicationController < ActionController::Base
    #todas as requisições passam por aqui
    protect_from_forgery with: :exception
    before_action :set_locale, :current_url

    private
    def set_locale
        if params[:locale]
            cookies[:locale] = params[:locale]
        end

        if cookies[:locale]
            if I18n.locale != cookies[:locale]
                I18n.locale = cookies[:locale]
            end
        end
    end

    def current_url
        @current_url = request.base_url
    end
end
