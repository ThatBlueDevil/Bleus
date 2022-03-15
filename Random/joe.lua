local starterGui = game:GetService('StarterGui');
local replicatedStorage = game:GetService('ReplicatedStorage');

local insults = {
    'your trash',
    'dogwater',
    'slow',
    'ez bad',
    'your so balon i had to make a new word to describe you',
    'garbage',
    'your so bad kid',
    'get good LOL',
    'did you learn to play from wikihow? explains alot!'
}

starterGui:SetCore('ChatMakeSystemMessage', { Text = '[Insult o Matic]: Loaded!' });
local insultMeta; do 
    insultMeta = hookmetamethod(game, '__namecall', function(self, ...)
        local args, method = {...}, getnamecallmethod();
        if method == 'FireServer' and self.Name == 'SayMessageRequest' then
            if (args and args[1] == '/insult') then
                args[1] = '';
                replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(insults[math.random(1, #insults)], 'All');
            end;
        end;
        
        return insultMeta(self, unpack(args));
    end);
end;
