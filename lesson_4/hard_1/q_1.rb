=begin
Alyssa has been assigned a task of modifying 
a class that was initially created to keep 
track of secret information. The new requirement 
calls for adding logging, when clients of the 
class attempt to access the secret data. Here 
is the class in its current form:
=end

class SecretFile
  attr_reader :log_entry

  def initialize(secret_data, log_entry)
    @data = secret_data
    @log_entry = log_entry
  end
    
  def data
    log_entry.create_log_entry
    @data
  end

end

=begin
She needs to modify it so that any access 
to data must result in a log entry being 
generated. That is, any call to the class 
which will result in data being returned must 
first call a logging class. The logging class 
has been supplied to Alyssa and looks like 
the following:
=end

class SecurityLogger
  
  def create_log_entry
    @time_accessed = "The data was accessed at: #{Time.now}"
  end
  
end

log_entry_1 = SecurityLogger.new
secret_file_1 = SecretFile.new("I ate pizza while on a diet.", log_entry_1)

p secret_file_1.data
p secret_file_1



