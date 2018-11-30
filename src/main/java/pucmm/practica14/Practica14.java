package pucmm.practica14;


import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H2;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.router.RouterLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Component;
import pucmm.practica14.Vaadin.Calendario;
import pucmm.practica14.Vaadin.EventoCrud;
import pucmm.practica14.Vaadin.RolCrud;
import pucmm.practica14.Vaadin.UsuarioCrud;
import pucmm.practica14.service.UsuarioService;

import javax.annotation.PostConstruct;

@SpringBootApplication
public class Practica14  {

	public static void main(String[] args) {
		SpringApplication.run(Practica14.class, args);
	}

	@Route("")
	public static class MiView extends VerticalLayout {



		public MiView(){
//			add(new Button("Presionar", new ComponentEventListener<ClickEvent<Button>>() {
//				@Override
//				public void onComponentEvent(ClickEvent<Button> event) {
//					Notification.show("Presioando el botón....");
//				}
//			}));

			//creando rutas.
			crearRutas();
		}

		/**
		 * Creando la creación de las rutas.
		 */
		private void crearRutas(){
			VerticalLayout caja = new VerticalLayout();
			caja.add(new H2("Enlaces a funcionalidades:"));
			//con RouterLink el renderizado no recarga la pagina.
//			caja.add(new RouterLink("Hola Mundo", HolaMundoVaadin.class));
//			caja.add(new RouterLink("Indice de URL parametros",ConocerURL.class));
//			caja.add(new RouterLink("Ejemplo de Grid", EjemploGrid.class));
//			caja.add(new RouterLink("Ejemplo de Binder", EjemploBinder.class));
            caja.add(new RouterLink("Calendario", Calendario.class));
			caja.add(new RouterLink("Eventos", EventoCrud.class));
			caja.add(new RouterLink("Usuarios", UsuarioCrud.class));
			caja.add(new RouterLink("Roles", RolCrud.class));

			add(caja);
		}
	}

	@Component
	static class BootStrap{
		@Autowired
		UsuarioService usuarioService;

		@PostConstruct
		public void init(){
			System.out.println("Creando los estudiantes de prueba");

		}
	}

}

