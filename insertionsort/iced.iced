use iced::{button, Button, Column, Element, Sandbox, Settings, Text};

fn insertion_sort(arr: Vec<i32>) -> Vec<i32> {
    let mut a = arr;
    let n = a.len();
    for i in 1..n {
        let key = a[i];
        let mut j = i as isize - 1;
        while j >= 0 && a[j as usize] > key {
            a[(j + 1) as usize] = a[j as usize];
            j -= 1;
        }
        a[(j + 1) as usize] = key;
    }
    a
}

struct SortApp {
    arr: Vec<i32>,
    sorted: Vec<i32>,
    button: button::State,
}

#[derive(Debug, Clone)]
enum Message { Sort }

impl Sandbox for SortApp {
    type Message = Message;

    fn new() -> Self {
        Self { arr: vec![5, 3, 1, 4, 2], sorted: vec![], button: button::State::new() }
    }

    fn title(&self) -> String { String::from("Insertion Sort") }

    fn update(&mut self, message: Message) {
        match message {
            Message::Sort => self.sorted = insertion_sort(self.arr.clone()),
        }
    }

    fn view(&mut self) -> Element<Message> {
        Column::new()
            .push(Button::new(&mut self.button, Text::new("Sort")).on_press(Message::Sort))
            .push(Text::new(self.sorted.iter().map(|x| x.to_string()).collect::<Vec<_>>().join(", ")))
            .into()
    }
}
