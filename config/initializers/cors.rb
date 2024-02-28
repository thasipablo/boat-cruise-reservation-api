Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'

    resource '/signup',
      headers: :any,
      methods: [:post],
      credentials: true
  end

  allow do
    origins 'http://localhost:5173'

    resource '/login',
      headers: :any,
      methods: [:post],
      credentials: true
  end

  allow do
    origins 'http://localhost:5173'

    resource '/logout',
      headers: :any,
      methods: [:post],
      credentials: true
  end
end
