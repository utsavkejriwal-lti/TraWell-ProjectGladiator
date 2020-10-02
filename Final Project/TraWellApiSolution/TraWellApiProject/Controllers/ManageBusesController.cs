using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using TraWellApiProject.Models;

namespace TraWellApiProject.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ManageBusesController : ApiController
    {
        private TraWellEntities db = new TraWellEntities();

        // GET: api/ManageBuses
        public IQueryable<Bus> GetBuses()
        {
            return db.Buses;
        }

        // GET: api/ManageBuses/5
        [ResponseType(typeof(Bus))]
        public IHttpActionResult GetBus(int id)
        {
            Bus bus = db.Buses.Find(id);
            if (bus == null)
            {
                return NotFound();
            }

            return Ok(bus);
        }

        // PUT: api/ManageBuses/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBus(int id, Bus bus)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != bus.Id)
            {
                return BadRequest();
            }

            db.Entry(bus).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BusExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/ManageBuses
        [ResponseType(typeof(Bus))]
        public IHttpActionResult PostBus(Bus bus)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Buses.Add(bus);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = bus.Id }, bus);
        }

        // DELETE: api/ManageBuses/5
        [ResponseType(typeof(Bus))]
        [HttpDelete]
        public IHttpActionResult DeleteBus([FromUri] int id)
        {
            Bus bus = db.Buses.Find(id);
            if (bus == null)
            {
                return NotFound();
            }

            db.Buses.Remove(bus);
            db.SaveChanges();

            return Ok(bus);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BusExists(int id)
        {
            return db.Buses.Count(e => e.Id == id) > 0;
        }
    }
}
