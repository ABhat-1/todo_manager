require 'active_record'

class User < ActiveRecord::Base

  def to_pleasant_string
    "#{id}.#{name},#{email},#{password}"
  end

end

