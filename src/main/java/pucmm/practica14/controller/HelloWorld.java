package pucmm.practica14.controller;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.theme.Theme;
import com.vaadin.flow.theme.lumo.Lumo;

@Route("hello-world")
@Theme(Lumo.class)
public class HelloWorld extends VerticalLayout {
    public HelloWorld() {
        // two components:
        TextField name = new TextField("Name");
        Button greet = new Button("Greet");
        // add them to "this" layout (a VerticalLayout)
        add(name, greet);
        // add logic through event listeners
        greet.addClickListener(event ->
                add(new Span("Hello, " + name.getValue())));
    }
}