require "vcardigan"

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
