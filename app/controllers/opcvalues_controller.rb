require 'opcua_client'


class OpcvaluesController < ApplicationController

  def index
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55000")
    @value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
    @opcvalues = Opcvalue.group_by_minute(:created_at).count
  end

  def create
    client = OPCUAClient::Client.new
    client.connect("opc.tcp://127.0.0.1:55000")
    
    @node_value = client.read_float(2, "OPCDACLIENT.opcdaclient.Sinusoid.PsFloat1")
    @opcvalue = Opcvalue.new
    @opcvalue.value = @node_value
    @opcvalue.place = "RIG1"
    
    if @opcvalue.save
      redirect_to root_path
      flash[:success] = 'Save Complite' 
    else
      redirect_to opcvalues_path
      flash[:success] = 'not save value'
    end
  end

end
