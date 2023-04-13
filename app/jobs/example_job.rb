class ExampleJob < ApplicationJob
  queue_as :default

  def perform
    # client = OPCUAClient::Client.new
    # client.connect("opc.tcp://127.0.0.1:55000")
    
    # @node_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Static.PsFloat1")
    # @opcvalue = Opcvalue.new
    # @opcvalue.value = @node_value
    # @opcvalue.place = "RIG1"
    # @opcvalue.save
    puts "hello world"
    sleep(1)
    ExampleJob.perform_now
  end
end



