/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sesion;

import entidad.Examen;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

/**
 *
 * @author matia
 */
@Stateless
public class ExamenFacade extends AbstractFacade<Examen> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExamenFacade() {
        super(Examen.class);
    }

    public List<Examen> findMesasJulio() {
        return getEntityManager().createQuery(
            "SELECT e FROM Examen e "
          + "WHERE FUNCTION('MONTH', e.examenPK.fecha) = 7 "
          + "ORDER BY e.examenPK.fecha", Examen.class)
          .getResultList();
    }
}
