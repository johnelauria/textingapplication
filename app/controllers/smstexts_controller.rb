class SmstextsController < ApplicationController

  require 'rubygems'
  require 'clickatell'

  # GET /smstexts
  # GET /smstexts.json
  def index
    @smstexts = Smstext.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smstexts }
    end
  end

  # GET /smstexts/1
  # GET /smstexts/1.json
  def show
    @smstext = Smstext.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smstext }
    end
  end

  # GET /smstexts/new
  # GET /smstexts/new.json
  def new
    @smstext = Smstext.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smstext }
    end
  end

  # GET /smstexts/1/edit
  def edit
    @smstext = Smstext.find(params[:id])
  end

  # POST /smstexts
  # POST /smstexts.json
  def create
    api = Clickatell::API.authenticate(3394680, "johnelauria", "$ys2012tems?")
    @smstext = Smstext.new(params[:smstext])
    recipient = @smstext.recipient
    smsmessage = @smstext.smsmessage
    api.send_message(recipient, smsmessage)

    respond_to do |format|
      if @smstext.save
        format.html { redirect_to @smstext, notice: "A SMS message was successfully sent to #{recipient}" }
        format.json { render json: @smstext, status: :created, location: @smstext }
      else
        format.html { render action: "new" }
        format.json { render json: @smstext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smstexts/1
  # PUT /smstexts/1.json
  def update
    @smstext = Smstext.find(params[:id])

    respond_to do |format|
      if @smstext.update_attributes(params[:smstext])
        format.html { redirect_to @smstext, notice: 'Smstext was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smstext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smstexts/1
  # DELETE /smstexts/1.json
  def destroy
    @smstext = Smstext.find(params[:id])
    @smstext.destroy

    respond_to do |format|
      format.html { redirect_to smstexts_url }
      format.json { head :no_content }
    end
  end
end
