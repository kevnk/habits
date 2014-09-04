# Habitapp.ApplicationAdapter = DS.FixtureAdapter

Habitapp.Store = DS.Store.extend()
Habitapp.ApplicationSerializer = DS.LSSerializer.extend()
Habitapp.ApplicationAdapter = DS.LSAdapter.extend(
  namespace: 'habitapp'
)