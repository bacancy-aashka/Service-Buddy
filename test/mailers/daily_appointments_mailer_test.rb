require 'test_helper'

class DailyAppointmentsMailerTest < ActionMailer::TestCase
  test "mail_to_providers" do
    mail = DailyAppointmentsMailer.mail_to_providers
    assert_equal "Mail to providers", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
