class CheckOfflineDevicesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def perform
    offline_threshold = 1.minutes.ago

    devices = Esp8266.where('last_seen < ?', offline_threshold)

    devices.each do |device|
      # Lógica para tratamento de dispositivos offline
      # Por exemplo, enviar notificações ou executar ações específicas

      device.update(status: 'offline')
    end
  end
end
