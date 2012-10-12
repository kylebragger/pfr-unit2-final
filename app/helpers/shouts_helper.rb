module ShoutsHelper
  def shout_date(shout)
    # October 17, 1930
    shout.created_at.strftime('%B %-d, %Y')
  end
end
