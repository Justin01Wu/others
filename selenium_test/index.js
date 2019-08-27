// test careers search
var webdriver = require('selenium-webdriver');
var fs = require('fs');

(async function start(){
let driver = await new webdriver.Builder().withCapabilities(webdriver.Capabilities.chrome()).build();

await driver.get('https://www.validusholdings.com/careers/');
	
console.log("           ==>opened the page");
	
await  find_element_click_and_wait('//*[@id="saveChangesCookies"]', 5000);	
console.log("           ==>clicked save cookies button");
		

// Click 'Vacancies'
console.log("          ==>Clicking on Vacancies");
    
await find_element_click_and_wait('//a[contains(@class, "btn-primary")]', 5000)
	
	//*[@id="wrapper"]/div[4]/div[1]/div[2]/div/div/a

// Switch window handle
console.log("          ==>Switch window handle");
let validus_handle = await driver.getWindowHandle();	
let all_windows  = await driver.getAllWindowHandles();
let workday_handle = all_windows[1];
driver.switchTo().window(workday_handle);


await driver.sleep(15000);
let myTtitle  = await driver.getTitle();
console.log("myTtitle = "+  myTtitle);

console.log("          ==>find check box");
await find_element_click_and_wait('//*[@id="wd-FacetValue-CheckBox-bc33aa3152ec42d4995f4791a106ed09"]/div', 5000);

await driver.sleep(5000);
// Search for search text
console.log('          ==>Sending search text into search bar');
let search_bar = await driver.findElement(webdriver.By.xpath('//*[@id="wd-AdvancedFacetedSearch-SearchTextBox-input"]'));
await search_bar.sendKeys('Quality');
await find_element_click_and_wait('//button[@data-automation-id="advancedSearchButton"]', 5000);

// Search for search text
await driver.sleep(10000);

let numberOfResults = await driver.findElement(webdriver.By.xpath('//*[@id="wd-FacetedSearchResultList-PaginationText-facetSearchResultList.newFacetSearch.Report_Entry"]'));

let num = await numberOfResults.getText();

console.log("          numberOfResults = ", num);

saveResult('//span[contains(@title,"Posted Today")]');
saveResult('//span[contains(@title,"Posted Yesterday")]');

async function saveResult(xpath) { 
	let result = await driver.findElements(webdriver.By.xpath(xpath));
	let num = await result.length;
	for(var i=0;i<num;i++){
		let job = await result[i].getText();
		let jobId = job.split("|")[1];
		console.log("          jobId = ", jobId);
		fs.appendFile('jobs.txt', jobId + "\r\n", function (err) {
			if (err) {
				// append failed
				console.log(err);
			} else {
			// done
			}
		})
	}
}
		
async function find_element_click_and_wait(xpath, wait) { 
    await driver.sleep(wait);
	return await driver.findElement(webdriver.By.xpath(xpath)).click();	
}   

//browser.quit();
})()