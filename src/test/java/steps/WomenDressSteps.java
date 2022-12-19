package steps;

import io.cucumber.java.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;

import java.io.File;
import java.util.List;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.openqa.selenium.firefox.ProfilesIni;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.firefox.FirefoxOptions;


public class WomenDressSteps {
	
	static WebDriver driver;
	
	@BeforeAll()
	public static void setUp() {
		System.setProperty("webdriver.gecko.driver", "Drivers/geckodriver");
		
		FirefoxProfile profile = new FirefoxProfile();
		profile.addExtension(new File("Drivers/adblocker_ultimate-3.7.19.xpi"));
		FirefoxOptions opt = new FirefoxOptions();
		opt.setProfile(profile);
			
		driver = new FirefoxDriver(opt);
    }
	
	@Given("the user is in the page {string}")
	public void theUserIsInThePage(String url) {
		driver.navigate().to(url);
	}
	
	@When("the user clicks {string} class button")
	public void clickClassButton(String button_class) {
		driver.findElements(By.cssSelector(button_class)).get(0).click();
	}

	@When("the user clicks {string} partialLinkText button") 
	public void clickPartialLinkTextButton(String button_name) {
		driver.findElement(By.partialLinkText(button_name)).click();
	}
	
	@And("the user clicks {string} id button")
	public void clickIdButton(String button_id) {
		driver.findElement(By.id(button_id)).click();
	}
	
	@And("the user enters {string} in the {string} input id")
	public void theUserEntersStringInInputCell(String serach_string, String element_id) {
		driver.findElement(By.id(element_id)).sendKeys(serach_string);
	}
	
	@Then("the dress list appears")
	public void theDressListAppears() {
		String title = driver.findElement(By.className("features_items")).getText();
		Assert.assertTrue(title.contains("SEARCHED PRODUCTS"));
	}

	@Then("the list appears empty")
	public void theListAppearsEmpty() {
		String result = driver.findElement(By.className("col-sm-4")).getText();
		Assert.assertTrue(result == "");
	}
	
	@Then("the KIDS - TOPS & SHIRTS PRODUCTS list appears")
	public void theKIDS_TOPS_and_SHIRTS_PRODUCTS_list_appears() {
		String title = driver.findElement(By.xpath("/html/body/section/div/div[2]/div[2]/div/h2")).getText();	
		Assert.assertTrue(title.contains("KIDS - TOPS & SHIRTS PRODUCT"));
	}
	
	@And("the confirmation cart box is displayed")
	public void theConfirmationCartBoxIsDisplayed() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		String title = driver.findElement(By.xpath("/html/body/section/div/div/div[2]/div[1]/div/div/div[1]/h4")).getText();	
		Assert.assertTrue(title.contains("Added!"));
	}	
	
	@When("the user fills {string} data-qa with {string}")
	public void fillFormDataQA(String form_quality_qa_cell, String value) {
		driver.findElements(By.cssSelector("[data-qa=\"" + form_quality_qa_cell + "\"]")).get(0).sendKeys(value);
	}
	
	@When("the user fills {string} id with {string}")
	public void fillFormId(String form_id_cell, String value) {
		driver.findElements(By.id(form_id_cell)).get(0).sendKeys(value);
	}
	
	
	@And("wait {int} mili-seconds")
	public void wait_miliseconds(int time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	@Then("the msg {string} is displayed in {string}")
	public void checkTextAppears(String txt, String xpath) {
		String title = driver.findElement(By.xpath(xpath)).getText();
		Assert.assertTrue(title.contains(txt));
	}
	
	@Then("the msg {string} is not displayed in {string}")
	public void checkTextDoesntAppears(String txt, String xpath) {		
		//List<WebElement> l=driver.findElements(By.xpath(xpath));
		//Assert.assertEquals(l.size(), 0);
		String title = driver.findElement(By.xpath(xpath)).getText();
		Assert.assertFalse(title.contains(txt));
	}
	
	@And("check id {string} exists")
	public void checkIdExists(String id) {
		driver.findElements(By.id(id));
	}
	
	@And("log out if siggned in")
	public void logout() {
		List<WebElement> l=driver.findElements(By.xpath("//*[@id=\"header\"]/div/div/div/div[2]/div/ul/li[4]/a"));
		if(l.size() > 0) {
			clickPartialLinkTextButton("Logout");
		}
	}
	
	@And("delete account")
	public void deleteAccount() {
		List<WebElement> l=driver.findElements(By.xpath("//*[@id=\"header\"]/div/div/div/div[2]/div/ul/li[5]/a"));
		if(l.size() > 0) {
			driver.findElement(By.xpath("//*[@id=\"header\"]/div/div/div/div[2]/div/ul/li[5]/a")).click();
		}
	}
	
	@Then("check alert msg is {string}")
	public void checkAlertMsg(String msg) {
		String alert_response = driver.switchTo().alert().getText();
		Assert.assertEquals(alert_response, msg);
	}
	
	@Then("the alert is accepted")
	public void acceptAlert() {
		driver.switchTo().alert().accept();
	}
	
	@And("scroll down")
	public void scrollDown() {
		JavascriptExecutor js = (JavascriptExecutor) driver;
        //Scroll down till the bottom of the page
        js.executeScript("window.scrollBy(0,document.body.scrollHeight)");
	}
	
	@And("scroll down {string}")
	public void scrollDownUnits(String num) {
		JavascriptExecutor js = (JavascriptExecutor) driver;
        //Scroll down till the bottom of the page
        js.executeScript("window.scrollBy(0," + num +  ")");
	}

	@AfterAll()
    public static void tearDown() {
        driver.quit();
    }
	
}