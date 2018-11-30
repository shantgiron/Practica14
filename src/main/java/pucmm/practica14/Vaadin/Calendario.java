package pucmm.practica14.Vaadin;

import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.spring.annotation.SpringComponent;
import com.vaadin.flow.spring.annotation.UIScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.calendar.CalendarComponent;
import pucmm.practica14.model.Evento;
import pucmm.practica14.service.EventoService;
import pucmm.practica14.service.EventoServiceImpl;
import org.vaadin.calendar.data.AbstractCalendarDataProvider;

import java.util.Calendar;
import java.util.Collection;
import java.util.List;

@Route("calendario")
@SpringComponent
@UIScope
public class Calendario extends VerticalLayout {

    CalendarComponent<Evento> calendario = new CalendarComponent<Evento>().withItemDateGenerator(Evento::getDate).withItemLabelGenerator(Evento::getTitulo);

    @Autowired
    public  EventoServiceImpl eventoService;

    public Calendario(@Autowired EventoServiceImpl eventoService){

        this.eventoService = eventoService;

    }
}
