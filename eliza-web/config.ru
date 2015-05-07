run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ["
    <form action='Get'>
    <input class='text' name='user_input'><br>
    <button type='submit' >OK</input>"]] }
