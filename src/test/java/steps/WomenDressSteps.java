package steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;

public class WomenDressSteps {
	
	WebDriver driver;
	
	@Given("the user is in the index page")
	public void theUserIsInTheIndexPhase() {
		System.setProperty("webdriver.gecko.driver", "Drivers/geckodriver");
		driver = new FirefoxDriver();
		driver.navigate().to("https://automationexercise.com");
	}
	
	@When("the user clicks the products option")
	public void theUserClicksTheProductsOption() {
		driver.findElement(By.partialLinkText("Products")).click();
	}
	
	@And("the user enters dress in the search bar")
	public void theUserEntersDressInTheSearchBar() {
		driver.findElement(By.id("search_product")).sendKeys("dress");
	}
	
	@And("the user clicks the search button")
	public void theUserClicksSearchButton() {
		driver.findElement(By.id("submit_search")).click();
	}
	
	@Then("the dress list appears")
	public void theDressListAppears() {
		String title = driver.findElement(By.className("features_items")).getText();
		Assert.assertTrue(title.contains("SEARCHED PRODUCTS"));
	}
}
