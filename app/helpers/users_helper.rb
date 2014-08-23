module UsersHelper

  def create_fb_friends(friends)
        friends.each do |friend|
          @new_user = User.find_by_uid(friend['id'])
          unless @new_user.present?
            @new_user = User.new
            @new_user.uid = friend['id']
            @new_user.name = friend['name']
            @new_user.save
          end
            if  current_user.friends_rels.to_other(@new_user).blank?
              current_user.friends << @new_user
              current_user.save!
            end

        end
  end


end
