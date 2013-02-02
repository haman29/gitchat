class Room < ActiveRecord::Base
  attr_accessible :created_at, :del_flg, :deleted_at, :max_head_count, :name, :updated_at, :version
end
