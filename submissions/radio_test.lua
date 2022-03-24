function init()

end

function step()
   if robot.id == "gpr-bot0" then
		robot.radios.radio_tx.tx_data({1.5,69,80085})
	else 
		robot.radios.radio_tx.tx_data({0,10,123})
	end
end

function reset()
 -- start the passing of the token
end

function destroy()
end