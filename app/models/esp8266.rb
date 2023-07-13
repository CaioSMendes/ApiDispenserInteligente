class Esp8266 < ApplicationRecord
    validates :device, presence: true, uniqueness: true
    validates :status, presence: true
    # ... Outras validações

    def online?
        last_seen.present? && last_seen > 20.seconds.ago
    end

    def mark_as_online
        update(last_seen: Time.current)
    end

    def mark_as_offline
        update(last_seen: nil)
    end
end
