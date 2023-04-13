class HardJob
  require 'opcua_client'
  include Sidekiq::Job

  def perform(*args)
    sleep(2)
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55000")
    
    @node_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
    client.disconnect
    @opcvalue = Opcvalue.new
    @opcvalue.value = @node_value
    @opcvalue.place = "RIG1"
   
    if @opcvalue.save
      puts 'Value save!'
    else
      puts 'Error'
    end

    HardJob.perform_async
  end
end
