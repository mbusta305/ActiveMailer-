require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "follow_up" do
    target_mail = 'me@example.com'
    mail = UserMailer.follow_up(target_mail).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    # assert_equal "Follow up", mail.subject
    assert_equal [target_mail], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "How are things going?", mail.subject
    assert_match "Twitter and Facebook", mail.body.encoded
  end

end
