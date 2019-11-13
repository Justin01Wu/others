import boto3

#Explicit Client Configuration

polly = boto3.client('polly')
mySentence = ('Please log in to start creating quizzes to practice and study. '
	'If you haven’t yet created an account, follow the Create Account link to get started.'
	' Once you have an account created and are logged in, '
	'you’ll be able to redeem your Access Code or PIN to add products to your account.')
result = polly.synthesize_speech(Text=mySentence,
	OutputFormat='mp3',
	VoiceId='Aditi')

# Save the Audio from the response
audio = result['AudioStream'].read()
with open("helloworld.mp3","wb") as file:
	file.write(audio)
