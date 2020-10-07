# connect strip keys to rails credentials
Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.dig(:stripe)[:publishable_key],
  :private_key => Rails.application.credentials.dig(:stripe)[:private_key]
}

Stripe.api_key = Rails.application.credentials.dig(:stripe)[:private_key] 