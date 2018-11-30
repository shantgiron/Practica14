package pucmm.practica14.service;

import pucmm.practica14.model.Evento;

import java.time.LocalDate;
import java.util.List;

public interface EventoService {

    void crearEvento(Evento evento);
    void actualizarEvento(Evento evento);
    void borrarEventoPorId(long id);
    void borrarTodosLosEventos();
    List<Evento> buscarTodosEventos();
    Evento buscarPorId(long id);
    List<Evento> findAllByFecha(LocalDate fecha);
}
