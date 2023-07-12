class Esp8266 < ApplicationRecord
    validates :device, presence: true, uniqueness: true
    validates :status, presence: true
    # ... Outras validações

    def mark_as_online
        update(last_seen: Time.current)
    end

    def mark_as_offline
        update(last_seen: nil)
    end
end
