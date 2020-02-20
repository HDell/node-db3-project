const knex = require('knex');
const configOptions = require('../knexfile.js').development;
const db = knex(configOptions);

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where("id", id) //comma is used for in for equals; alternatives: {'id': id} or {id} (which implies the former)
        .first();
}

function findSteps(id) {
    return db('steps as st')
        .join("schemes as sc", "sc.id", "st.scheme_id")
        .select("st.id", "sc.scheme_name", "st.step_number", "st.instructions")
        .where("scheme_id", id)
        .orderBy("st.step_number", "asc");
}

function add(scheme) {
    return db('schemes')
        .add(scheme)
        .then(ids => {
            return findById(ids[0]);
        });
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where("id", id)
        .del();
}