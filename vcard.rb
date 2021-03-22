require "vcardigan"
require "twilio-ruby"

account_sid = '<your account sid>'
auth_token = '<your auth token>'

# create vcard
vcard = VCardigan.create(:version => '4.0')
vcard.fullname 'Valeriane Venance'
vcard.tel '+33644608263', :type => 'work'
vcard.email 'vvenance@twilio.com', :type => 'work'
vcard[:item1].url 'https://www.twilio.com/blog/author/vvenance'

# generate vcf file
file = File.open("vcard.vcf", "w")
file.puts vcard
file.close

# create Twilio client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# send message
message = @client.messages.create(
  body: 'Here is my contact !',
  from: '<your twilio number>',
  media_url: 'http://<your ngrok url>.ngrok.io/vcard.vcf',
  to: '<your phone number>')
