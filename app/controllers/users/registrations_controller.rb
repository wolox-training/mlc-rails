module Users
  class RegistrationsController < Devise::RegistrationsController
    # rubocop:disable Metrics/AbcSize
    def create
      if params['user']['uid'].nil? && params['user']['provider'].nil?
        configure_permitted_parameters
        params['user']['uid'] = params['user']['email']
        params['user']['provider'] = 'email'
      end
      super
    end
    # rubocop:enable Metrics/AbcSize
  end
end
