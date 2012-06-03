require 'yaml'

begin
  require 'aws/s3'
rescue Exception => e
end

desc "Update bootstrap"
task :bootstrap do
  puts "\nClone bootstrap somewhere if you haven't already:".yellow
  puts "\n  git clone git://github.com/twitter/bootstrap.git"
  path = q("\nWhat is the path to your bootstrap clone?")
  exec("./run.sh bootstrap '#{path}'")
end

desc "Deploy"
task :deploy do
  system("./run.sh prod")
  connect_to_s3!
  unless config['bucket'] =~ /^(?![0-9]+$)(?!-)[a-zA-Z0-9-]{,63}(?<!-)$/
    puts "\nInvalid bucket name!".red
    puts "\nYou probably need to remove uppercase and special characters from your bucket name.\n".yellow
    exit
  end
  if AWS::S3::Base.connected?
    puts "\nConnected to S3.".green
  else
    puts "\nCould not connect to S3!\n".red
    exit
  end
  begin
    AWS::S3::Bucket.find(config['bucket']).delete_all
    puts "\nDeleted all files.".green
  rescue Exception => e
    AWS::S3::Bucket.create(config['bucket'], :access => :public_read)
    puts "\nBucket '#{config['bucket']}' created.".green
    puts "\nYou should enable static website hosting at https://console.aws.amazon.com/s3".yellow
  end
  Dir.chdir("public") do
    Dir.glob("**/*").each do |path|
      if File.file?(path)
        puts "\nUploading #{path}...".yellow
        AWS::S3::S3Object.store(path, open(path), config['bucket'], :access => :public_read)
        puts "Uploaded: #{AWS::S3::S3Object.url_for(path, config['bucket'])}".green
      end
    end
  end
  puts "\n"
end

desc "Dev mode"
task :dev do
  exec("./run.sh dev")
end

desc "Install dependencies"
task :install do
  exec("./run.sh install")
end

desc "Prod mode"
task :prod do
  exec("./run.sh prod")
end

###

def connect_to_s3!
  AWS::S3::Base.establish_connection!(
    :access_key_id => config['access_key_id'],
    :secret_access_key => config['secret_access_key']
  )
end

def config
  @@config ||= YAML.load(File.read("config/aws.yml"))
end

def q(question, extra='')
  puts "#{question.yellow}#{extra}"
  $stdin.gets.strip
end

class String
  def green
    "\e[32m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end