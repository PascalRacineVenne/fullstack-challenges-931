EMAIL_REGEX = /^(?<name>[^@]+)@(?<domain>[^@]+)\.(?<tld>[a-z]{2,6})$/


def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(EMAIL_REGEX)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  emails.filter { |email| email.match?(EMAIL_REGEX)}
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  emails.group_by do |email|
    email.match(/\.([a-z]{2,6})/)[1]
  end
end

def compose_mail(email)
  match_data = email.match(EMAIL_REGEX)
  # p match_data
  {
    username: match_data[:name],
    domain: match_data[:domain],
    tld: match_data[:tld]
  }
  # TODO: return a Hash with username, domain and tld extracted from email
end

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
end
