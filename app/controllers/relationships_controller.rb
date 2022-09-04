class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user) # current_userが@userをフォロー
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def create_all
    respond_to do |format|
      if params[:users].nil? # チェックがない場合
        format.html { redirect_to users_path }
      else # チェックされたユーザを一括フォロー
        users_id_list = params[:users].map(&:to_i) # チェックされたユーザのidをint型で配列に格納
        users_id_list.each do |id| # 配列に含まれるユーザを1人ずつフォロー
          if current_user.following.ids.include?(id) # チェックされたユーザをすでにフォローしていたら次のidへ
            next
          end
          user = User.find(id)
          current_user.follow(user)
        end
        format.html { redirect_to users_path }
      end
    end
  end
end
