class FtpserversController < ApplicationController
  PER_PAGE = 20
  # GET /ftpservers
  # GET /ftpservers.xml
  def index
    @ftpserver = Ftpserver.new
    @ftpservers = Ftpserver.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ftpservers }
    end
  end

  # GET /ftpservers/1
  # GET /ftpservers/1.xml
  def show
    @ftpserver = Ftpserver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ftpserver }
    end
  end

  # GET /ftpservers/new
  # GET /ftpservers/new.xml
  def new
    @ftpserver = Ftpserver.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ftpserver }
    end
  end

  # GET /ftpservers/1/edit
  def edit
    @ftpserver = Ftpserver.find(params[:id])
  end

  # POST /ftpservers
  # POST /ftpservers.xml
  def create
    @ftpserver = Ftpserver.new(params[:ftpserver])

    respond_to do |format|
      if @ftpserver.save
        flash[:notice] = 'FTP Server was successfully created. Thanks for your sharing!'
        format.html { redirect_to :aciton => 'index'}
        format.xml  { render :xml => @ftpserver, :status => :created, :location => @ftpserver }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ftpserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ftpservers/1
  # PUT /ftpservers/1.xml
  def update
    @ftpserver = Ftpserver.find(params[:id])

    respond_to do |format|
      if @ftpserver.update_attributes(params[:ftpserver])
        flash[:notice] = 'Ftpserver was successfully updated.'
        format.html { redirect_to(@ftpserver) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ftpserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ftpservers/1
  # DELETE /ftpservers/1.xml
  def destroy
    @ftpserver = Ftpserver.find(params[:id])
    @ftpserver.destroy

    respond_to do |format|
      format.html { redirect_to(ftpservers_url) }
      format.xml  { head :ok }
    end
  end


end
