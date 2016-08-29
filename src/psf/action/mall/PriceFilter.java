package psf.action.mall;

public class PriceFilter {
	protected int minPrice = 0;
	protected int maxPrice = 0;
	
	public PriceFilter(int min,int max) {
		minPrice = min;
		maxPrice = max;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	
	public String toString() {
		return ""+minPrice+"-"+maxPrice;
	}
	
}
