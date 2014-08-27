module UsersHelper

  def create_fb_friends(friends)
        friends.each do |friend|
        #  if facebook.get_object(friend['id'])['gender'] != current_user.gender
                @new_user = User.find_by_uid(friend['id'])
                unless @new_user.present?
                  @new_user = User.new
                  @new_user.uid = friend['id']
                  @new_user.name = friend['name']
                  @new_user.save

                  current_user.friends << @new_user
                    if facebook.get_object(friend['id'])['gender'] == 'male'
                      current_user.friend_boys << @new_user
                    else
                      current_user.friend_girls << @new_user
                    end
                    current_user.save!

                else
                #  if  current_user.friends_rels.to_other(@new_user).blank?
                    current_user.friends << @new_user
                    if facebook.get_object(friend['id'])['gender'] == 'male'
                      current_user.friend_boys << @new_user
                    else
                      current_user.friend_girls << @new_user
                    end
                    current_user.save!
                #  end
                end
         # end
        end
  end


end
