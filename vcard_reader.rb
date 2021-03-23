require "twilio-ruby"

account_sid = '<your account sid>'
auth_token = '<your auth token>'

# create Twilio client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# send message
message = @client.messages.create(
  body: 'Ahoy, Val here ! Please find my contacts below !',
  from: '<your twilio number>',
  media_url: '<your twilio asset url>',
  to: ARGV[0].to_s)
