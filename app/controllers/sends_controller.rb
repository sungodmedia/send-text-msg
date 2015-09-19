class SendsController < ApplicationController
  before_action :set_send, only: [:show, :edit, :update, :destroy]

  # GET /sends
  # GET /sends.json
  def index
    @sends = Send.all
  end

  # GET /sends/1
  # GET /sends/1.json
  def show
  end

  # GET /sends/new
  def new
    @send = Send.new
  end

  # GET /sends/1/edit
  def edit
  end







  # POST /sends
  # POST /sends.json
  def create
    @send = Send.new(send_params)

    respond_to do |format|
      if @send.save
        
 ### SEND MESSAGE CODE SUSAN
        
          account_sid='ACb4180e7fb34e71988bdd9f1828b876c7'
          auth_token='fed04811f4bbb07d7e76046959d3d95b'

          begin
            @client = Twilio::REST::Client.new account_sid, auth_token
            @client.account.messages.create({:to => "+1"<< @send[:phone].gsub(/[^0-9]/,''),
              :from => "+16172846452",
              :body => @send[:message]
            })
          rescue Twilio::REST::RequestError => e
            format.html { redirect_to @send, notice: e.message}
            format.json { render :show, status: :created, location: @send }
          end
### END CODE    

        format.html { redirect_to @send, notice: 'The text message was successsfully sent.'}
        format.json { render :show, status: :created, location: @send }

      else
        format.html { render :new }
        format.json { render json: @send.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sends/1
  # PATCH/PUT /sends/1.json
  def update
    respond_to do |format|
      if @send.update(send_params)
        format.html { redirect_to @send, notice: 'Send was successfully updated.' }
        format.json { render :show, status: :ok, location: @send }
      else
        format.html { render :edit }
        format.json { render json: @send.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sends/1
  # DELETE /sends/1.json
  def destroy
    @send.destroy
    respond_to do |format|
      format.html { redirect_to sends_url, notice: 'Send was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send
      @send = Send.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_params
      params.require(:send).permit(:phone, :message)
    end
end
