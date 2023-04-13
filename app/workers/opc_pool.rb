class PollWorker
  # require 'opcua_client'
  include Sidekiq::Worker

  def perform
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55000")
    
    @node_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
    client.disconnect
    @opcvalue = Opcvalue.new
    @opcvalue.value = @node_value
    @opcvalue.place = "RIG1"
    @opcvalue.save
    puts "hello world"
    sleep(0.1)
    PollWorker.perform_async
  end
end