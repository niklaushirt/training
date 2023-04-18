FROM python:3.8   
ENV HOME_DIR=/home/app 

# set work directory  
RUN mkdir -p $HOME_DIR  
RUN mkdir -p $HOME_DIR/db

# where your code lives  
WORKDIR $HOME_DIR  

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY ./CODE $HOME_DIR  
# run this command to install all dependencies  
RUN pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 5000  
# start server  
CMD flask --app main.py run --host=0.0.0.0