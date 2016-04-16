class VisaApi
	require 'rest-client'
	require 'json'


	# Pulls card number to determine card attributes
	# bin, country, acc number code needed
	def generalAttrInquiry

		body='{ "primaryAccountNumber": "4465390000029077" }'

		path = "paai/generalattinq/v1/cardattributes/generalinquiry"

		callVisaApi(body, path)

	end


	# Take from general: country code, bin, acc number
	# Create Reference number & Trace Audit Number
	# Audit number ex. random 6 digit number
	def fundsTransferAttrInquiry

		path='paai/fundstransferattinq/v1/cardattributes/fundstransferinquiry'

		body='{
				  "acquirerCountryCode": "840",
				  "acquiringBin": "408999",
				  "primaryAccountNumber": "4957030420210512",
				  "retrievalReferenceNumber": "330000550000",
				  "systemsTraceAuditNumber": "451006"
			  }'

		callVisaApi(body, path)

	end

	def pullFundsTransaction

		body='''{
				  "acquirerCountryCode": "840",
				  "acquiringBin": "408999",
				  "amount": "124.02",
				  "businessApplicationId": "AA",
				  "cardAcceptor": {
				    "address": {
				      "country": "USA",
				      "county": "San Mateo",
				      "state": "CA",
				      "zipCode": "94404"
				    },
				    "idCode": "ABCD1234ABCD123",
				    "name": "Visa Inc. USA-Foster City",
				    "terminalId": "ABCD1234"
				  },
				  "cavv": "0700100038238906000013405823891061668252",
				  "foreignExchangeFeeTransaction": "11.99",
				  "localTransactionDateTime": "2016-04-16T19:36:03",
				  "retrievalReferenceNumber": "330000550000",
				  "senderCardExpiryDate": "2015-10",
				  "senderCurrencyCode": "USD",
				  "senderPrimaryAccountNumber": "4895142232120006",
				  "surcharge": "11.99",
				  "systemsTraceAuditNumber": "451001"
				}'''

		path = "visadirect/fundstransfer/v1/pullfundstransactions"

		callPullApi(body, path)

	end

	def pushFundsTransaction

		body='{
			  "acquirerCountryCode": "840",
			  "acquiringBin": "408999",
			  "amount": "124.05",
			  "businessApplicationId": "AA",
			  "cardAcceptor": {
			    "address": {
			      "country": "USA",
			      "county": "San Mateo",
			      "state": "CA",
			      "zipCode": "94404"
			    },
			    "idCode": "CA-IDCode-77765",
			    "name": "Visa Inc. USA-Foster City",
			    "terminalId": "TID-9999"
			  },
			  "localTransactionDateTime": "2016-04-16T20:14:16",
			  "merchantCategoryCode": "6012",
			  "pointOfServiceData": {
			    "motoECIIndicator": "0",
			    "panEntryMode": "90",
			    "posConditionCode": "00"
			  },
			  "recipientName": "rohan",
			  "recipientPrimaryAccountNumber": "4957030420210496",
			  "retrievalReferenceNumber": "412770451018",
			  "senderAccountNumber": "4653459515756154",
			  "senderAddress": "901 Metro Center Blvd",
			  "senderCity": "Foster City",
			  "senderCountryCode": "124",
			  "senderName": "Mohammed Qasim",
			  "senderReference": "",
			  "senderStateCode": "CA",
			  "sourceOfFundsCode": "05",
			  "systemsTraceAuditNumber": "451018",
			  "transactionCurrencyCode": "USD",
			  "transactionIdentifier": "381228649430015"
			}'

		path='visadirect/fundstransfer/v1/pushfundstransactions'

		callVisaApi(body, path)

	end

	def reverseFundsTransaction

		body='{
			  "acquirerCountryCode": "608",
			  "acquiringBin": "408999",
			  "amount": "24.01",
			  "cardAcceptor": {
			    "address": {
			      "country": "USA",
			      "county": "San Mateo",
			      "state": "CA",
			      "zipCode": "94404"
			    },
			    "idCode": "VMT200911026070",
			    "name": "Visa Inc. USA-Foster City",
			    "terminalId": "365539"
			  },
			  "localTransactionDateTime": "2016-04-16T20:15:38",
			  "originalDataElements": {
			    "acquiringBin": "408999",
			    "approvalCode": "20304B",
			    "systemsTraceAuditNumber": "897825",
			    "transmissionDateTime": "2016-04-16T20:15:38"
			  },
			  "pointOfServiceCapability": {
			    "posTerminalEntryCapability": "2",
			    "posTerminalType": "4"
			  },
			  "pointOfServiceData": {
			    "motoECIIndicator": "0",
			    "panEntryMode": "90",
			    "posConditionCode": "00"
			  },
			  "retrievalReferenceNumber": "330000550000",
			  "senderCardExpiryDate": "2015-10",
			  "senderCurrencyCode": "USD",
			  "senderPrimaryAccountNumber": "4895100000055127",
			  "systemsTraceAuditNumber": "451050",
			  "transactionIdentifier": "381228649430011"
			}'

		path='visadirect/fundstransfer/v1/reversefundstransactions'

		callVisaApi(body, path)

	end

	def crackTime

		time = Time.now

		year_first = time.year.to_s[3]

		year_first << time.yday.to_s << time.hour.to_s << (time.to_f / 1000000).to_s[-6..17]

	end


	def callVisaApi(body, path)

			url = 'https://sandbox.api.visa.com/' + path
			user_id = 'QT4SWQXB34M44J2AJS1121VNdpvQXX57ULXHpf3E4CHSWIPog'
			password = '5A238PyD6O7Wqw'
			headers = {'content-type'=> 'application/json', 'accept'=> 'application/json'}
		  
		begin
		    response = RestClient::Request.execute(
		        :method => :post,
		        :url => url,
		        :headers => headers,
		        :payload => body,
		        :user => user_id, :password => password,
		        :ssl_client_key => OpenSSL::PKey::RSA.new(File.read('./config/key_testworkplease.pem')),
		        :ssl_client_cert =>  OpenSSL::X509::Certificate.new(File.read('./config/cert.pem'))
		    )
		rescue RestClient::ExceptionWithResponse => e
	    	response = e.response
	  	end
	  		puts response
	  		return response

	end

	def callPullApi(body, path)

			url = 'https://sandbox.api.visa.com/' + path
			user_id = 'QT4SWQXB34M44J2AJS1121VNdpvQXX57ULXHpf3E4CHSWIPog'
			password = '5A238PyD6O7Wqw'
			headers = {'content-type'=> 'application/json', 'accept'=> 'application/json'}
		  
		begin
		    response = RestClient::Request.execute(
		        :method => :post,
		        :url => url,
		        :headers => headers,
		        :payload => body,
		        :user => user_id, :password => password,
		        :ssl_client_key => OpenSSL::PKey::RSA.new(File.read('./config/key_testworkplease.pem')),
		        :ssl_client_cert =>  OpenSSL::X509::Certificate.new(File.read('./config/cert.pem'))
		    )
		rescue RestClient::ExceptionWithResponse => e
	    	response = e.response
	  	end
	  	response = JSON.parse(response)

	  	if response["actionCode"] == "00"
	  		callPushApi()
	  	else
	  		puts "Failure..."
	  	end

	  		return response

	end

		def callPushApi()

			url = 'https://sandbox.api.visa.com/visadirect/fundstransfer/v1/pushfundstransactions'
			user_id = 'QT4SWQXB34M44J2AJS1121VNdpvQXX57ULXHpf3E4CHSWIPog'
			password = '5A238PyD6O7Wqw'
			headers = {'content-type'=> 'application/json', 'accept'=> 'application/json'}

			body = '{
					  "acquirerCountryCode": "840",
					  "acquiringBin": "408999",
					  "amount": "124.05",
					  "businessApplicationId": "AA",
					  "cardAcceptor": {
					    "address": {
					      "country": "USA",
					      "county": "San Mateo",
					      "state": "CA",
					      "zipCode": "94404"
					    },
					    "idCode": "CA-IDCode-77765",
					    "name": "Visa Inc. USA-Foster City",
					    "terminalId": "TID-9999"
					  },
					  "localTransactionDateTime": "2016-04-16T20:14:16",
					  "merchantCategoryCode": "6012",
					  "pointOfServiceData": {
					    "motoECIIndicator": "0",
					    "panEntryMode": "90",
					    "posConditionCode": "00"
					  },
					  "recipientName": "rohan",
					  "recipientPrimaryAccountNumber": "4957030420210496",
					  "retrievalReferenceNumber": "412770451018",
					  "senderAccountNumber": "4653459515756154",
					  "senderAddress": "901 Metro Center Blvd",
					  "senderCity": "Foster City",
					  "senderCountryCode": "124",
					  "senderName": "Mohammed Qasim",
					  "senderReference": "",
					  "senderStateCode": "CA",
					  "sourceOfFundsCode": "05",
					  "systemsTraceAuditNumber": "451018",
					  "transactionCurrencyCode": "USD",
					  "transactionIdentifier": "381228649430015"
					}'

		  
			begin
			    response = RestClient::Request.execute(
			        :method => :post,
			        :url => url,
			        :headers => headers,
			        :payload => body,
			        :user => user_id, :password => password,
			        :ssl_client_key => OpenSSL::PKey::RSA.new(File.read('./config/key_testworkplease.pem')),
			        :ssl_client_cert =>  OpenSSL::X509::Certificate.new(File.read('./config/cert.pem'))
			    )
			rescue RestClient::ExceptionWithResponse => e
		    	response = e.response
		  	end
		  	response = JSON.parse(response)

		  		puts "Transaction Complete!"
		  		puts response

		  		return response

		end










end