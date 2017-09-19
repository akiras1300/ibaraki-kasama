module MyUtility
    extend ActiveSupport::Concern # インスタンスメソッドのみの利用時は記述の必要なし
    # privateより上に記述したメソッドはコントローラクラスでコール可能
    def gettlist
       @tlist = ActsAsTaggableOn::Tag.all.pluck(:name);
       #@tlist=@tlist.join(",");
    end


end
