package aiwa.entity;

import java.util.ArrayList;
import java.util.List;

public class Test {

	public static void main(String[] args) {
		List<Item> items = new ArrayList<>();
		Item item1 = new Item();
		item1.setItemName("hang");
		items.add(item1);

		Item item2 = new Item();
		item2.setItemName("hanh");
		items.add(item2);

		Item item3 = new Item();
		item3.setItemName("duong");
		items.add(item3);
		change(items);
		show(items);
	}

	private static void change(List<Item> items) {
		Item item = items.get(0);
		item.setItemName("thu");
	}

	private static void show(List<Item> items) {
		for (Item item : items) {
			System.out.println(item.getItemName());
		}
	}
}
