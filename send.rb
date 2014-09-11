require 'uri'
require 'net/http'
require 'json'

content = "cmVxdWlyZSAndXJpJwpyZXF1aXJlICduZXQvaHR0cCcKcmVxdWlyZSAnanNvbicKCmNvbnRlbnQgPSAiYmFzZTY0IG9mIGNvbnRlbnQiCgptZXNzYWdlID0gCnsKICAna2V5JyA9PiBFTlZbJ0FQSV9LRVlfRU5WJ10sCiAgIm1lc3NhZ2UiID0+IHsKICAgICJzdWJqZWN0IiA9PiAiS3VzaGFsIE5pZ2FtJ3MgQ29kZSBTYW1wbGUiLAogICAgImZyb21fbmFtZSIgPT4gIkt1c2hhbCBOaWdhbSIsCiAgICAidGV4dCIgPT4gIkhlcmUgaXMgbXkgY29kZSBzYW1wbGUgb2YgbXkgaW1wbGVtZW50YXRpb24gb2YgdGhlIE1hbmRyaWxsIEFQSSIsCiAgICAidG8iID0+IFsKICAgICAgewogICAgICAgICJlbWFpbCIgPT4gImNvZGVzYW1wbGVAbWFpbGNoaW1wLmNvbSIsCiAgICAgICAgIm5hbWUiID0+ICJNYWlsQ2hpbXAiLAogICAgICAgICJ0eXBlIiA9PiAidG8iCiAgICAgIH0sCiAgICAgIHsKICAgICAgICAiZW1haWwiID0+ICJrbmlnYW1AZ2F0ZWNoLmVkdSIsCiAgICAgICAgIm5hbWUiID0+ICJLdXNoYWwgTmlnYW0iLAogICAgICAgICJ0eXBlIjogImNjIgogICAgICB9CiAgICBdLAogICAgImh0bWwiID0+ICI8aHRtbD48cD5IZXJlIGlzIG15IGNvZGUgc2FtcGxlIG9mIG15IGltcGxlbWVudGF0aW9uIG9mIHRoZSBNYW5kcmlsbCBBUEk8L3A+PC9odG1sPiIsCiAgICAiZnJvbV9lbWFpbCIgPT4ia25pZ2FtQGdhdGVjaC5lZHUiLAogICAgImF0dGFjaG1lbnRzIiA9PiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJ0eXBlIiA9PiAidGV4dC9wbGFpbiIsCiAgICAgICAgICAgICAgICAibmFtZSIgPT4gInNlbmQucmIiLAogICAgICAgICAgICAgICAgImNvbnRlbnQiID0+IGNvbnRlbnQKICAgICAgICAgICAgfQogICAgICAgIF0sCiAgfQp9Cgp1cmkgPSBVUkkucGFyc2UoImh0dHBzOi8vbWFuZHJpbGxhcHAuY29tL2FwaS8xLjAvbWVzc2FnZXMvc2VuZC5qc29uIikKaHR0cCA9IE5ldDo6SFRUUC5uZXcodXJpLmhvc3QsIHVyaS5wb3J0KQpodHRwLnVzZV9zc2wgPSB0cnVlCgpyZXF1ZXN0ID0gTmV0OjpIVFRQOjpQb3N0Lm5ldyh1cmkucGF0aCwgeydDb250ZW50LVR5cGUnID0+J2FwcGxpY2F0aW9uL2pzb24nfSkKcmVxdWVzdC5ib2R5ID0gbWVzc2FnZS50b19qc29uCnJlc3BvbnNlID0gaHR0cC5yZXF1ZXN0KHJlcXVlc3QpCnB1dHMgcmVzcG9uc2UuYm9keQo="

message = 
{
  'key' => ENV['API_KEY_ENV'],
  "message" => {
    "subject" => "Kushal Nigam's Code Sample",
    "from_name" => "Kushal Nigam",
    "text" => "Here is my code sample of my implementation of the Mandrill API",
    "to" => [
      {
        "email" => "codesample@mailchimp.com",
        "name" => "MailChimp",
        "type" => "to"
      },
      {
        "email" => "knigam@gatech.edu",
        "name" => "Kushal Nigam",
        "type" => "cc"
      }
    ],
    "html" => "<html><p>Here is my code sample of my implementation of the Mandrill API</p></html>",
    "from_email" =>"knigam@gatech.edu",
    "attachments" => [
            {
                "type" => "text/plain",
                "name" => "send.rb",
                "content" => content
            }
        ],
  }
}

uri = URI.parse("https://mandrillapp.com/api/1.0/messages/send.json")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
request.body = message.to_json
response = http.request(request)
puts response.body
