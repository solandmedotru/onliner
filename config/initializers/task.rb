sch = Rufus::Scheduler.new

sch.every "20s" do
  get_task
end

def get_task

  users = User.all
  users.each do |user|
    url = "https://api.vk.com/method/users.get.xml?user_ids=#{user.vk}&v=5.24&fields=online"
    xml = Nokogiri::XML(RestClient.get(url))

    onlaine = xml.css("online").text.to_i

    lasttake = user.takes.last

    if lasttake.try(:online) == true
      lasttake = 1
    else
      lasttake.try(:online) === false
      lasttake = 0
    end

    if lasttake != onlaine || user.takes.empty?

      take      = Take.new
      take.user = user

      if onlaine == 1
        take.onlaine = true
      else
        take.onlaine = false
      end
      take.save

    end
  end
end
