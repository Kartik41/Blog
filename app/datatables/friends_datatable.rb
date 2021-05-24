class FriendsDatatable < AjaxDatatablesRails::Base
 
  def view_columns
    
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      first_name:  { source: "Friend.first_name" },
      last_name:   { source: "Friend.last_name" },
      email:       { source: "Friend.email" },
      phone:       { source: "Friend.phone", searchable: false },
      age:         {source: "Friend.age"},
      twitter:     { source: "Friend.twitter" },
      gender:      {source: "Friend.gender"},
      #avatar:      {source:  "Friend.FriendsAttachments.avatar"},
      action: { source: ""}
      
    
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        
          first_name: record.first_name,
          last_name:  record.last_name,
          email:      record.email,
          phone:      record.phone,
          age:        record.age,
          twitter:    record.twitter,
          gender:     record.gender,
          action: prepare_html_for_action(record).html_safe
          
      }
    end
  end
  def prepare_html_for_action(record)
    "<div class='actions' style = 'float:left;'>
         <a  href='/friends/#{record.id}/edit' method = 'post'>Edit</a>
         <br>
         <a href ='/friends/#{record.id}' data-method = 'DELETE'>Delete</a>
    </div>"
  end

  private

  def get_raw_records
    friends = Friend.all
    #friends = Friend.includes(:friends_attachments).distinct.references(:friends_attachments)

    #if params[:maximum_age].present?

     # friends = friends.where("age <=?" , params[:maximum_age]) 
       
     #end
    #if params[:minimum_age].present?

     #friends = friends.where("age >=?" , params[:minimum_age])
    #end
    
    
    
    if params[:minimum_age].present? || params[:maximum_age].present?
        
      friends = friends.where("age >= ? AND age <= ?", params[:minimum_age] , params[:maximum_age])
          
    end

    if params[:gender].present? 
      friends = friends.where(:gender => params[:gender])
    end 
    #if params[:search].present?
     # friends = friends.where(:first_name => params[:search])
    #end
    friends
     
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
