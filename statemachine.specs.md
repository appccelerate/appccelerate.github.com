Appccelerate State Machine Specs
================================

Sync Initialization
-------------------

### Starting An Uninitialized State Machine

- establish an uninitialized state machine
- when starting the state machine
- should throw an invalid operation exception

### Reinitialization

- establish an initialized state machine
- when state machine is initialized again
- should throw an invalid operation exception

### Start

- establish an initialized state machine
- when starting the state machine
- should set current state of state machine to state to which it is initialized
- should execute entry action of state to which state machine is initialized

### Initialize A Loaded State Machine

- establish a loaded state machine
- when initializing the state machine
- should throw an invalid operation exception

### Initialize

- establish a state machine
- when state machine is initialized
- should not yet execute any entry actions

Sync Reporting
--------------

### Report

- establish a state machine
- establish a state machine reporter
- when creating a report
- it should call the passed reporter

Async Start Stop
----------------

### Starting

- (Background) establish initialized state machine
- establish some queued events
- when starting
- it should execute queued events

### Stopping

- (Background) establish initialized state machine
- establish started state machine
- when stopping a state machine
- when firing events onto the state machine
- it should queue events

Sync Passive State Machines
---------------------------

### Priority Events Queueing

- establish a passive state machine with transitions
- when firing a priority event onto the state machine
- it should queue event at the front

### Events Queueing

- establish a passive state machine with transitions
- when firing an event onto the state machine
- it should queue event at the end

### Custom Factory

- establish a custom factory
- when creating a passive state machine
- it should use custom factory to create internal instances

### Custom State Machine Name

- establish an instantiated passive state machine with custom name
- establish a state machine reporter
- when the state machine report is generated
- it should use custom name for state machine

### Default State Machine Name

- establish an instantiated passive state machine
- establish a state machine reporter
- when the state machine report is generated
- it should use the type of the state machine as name for state machine

Async Hierarchical Transitions
------------------------------

### No Common Ancestor

- establish a hierarchical state machine
- when firing an event resulting in a transition without a common ancestor
- it should execute exit action of source state
- it should execute exit action of parents of source state (recursively)
- it should execute entry action of parents of destination state (recursively)
- it should execute entry action of destination state
- it should execute actions from source upwards and then downwards to destination state

### Common Ancestor

- establish a hierarchical state machine
- when firing an event resulting in a transition with a common ancestor
- the state machine should remain inside common ancestor state

Sync Transitions
----------------

### Executing Transition

- establish a state machine with transitions
- when firing an event onto the state machine
- it should_execute_transition_by_switching_state
- it should_execute_transition_actions
- it should_pass_parameters_to_transition_action
- it should_execute_exit_action_of_source_state
- it should_execute_entry_action_of_destination_state

Async Guards
------------

### Otherwise Guard

- establish a state machine with otherwise guard and no machting other guard
- when an event is fired
- it should_take_transition_guarded_with_otherwise

### No Matching Guard

- establish state machine with no matching guard
- when an event is fired
- it should notify about declined transition

### Matching Guard

- establish a state machine with guarded transitions
- when an event is fired
- it should take transition guarded with first matching guard

Async Initialization
--------------------

### Starting An Uninitialized State Machine

- establish an uninitialized state machine
- when starting the state machine
- should throw an invalid operation exception

### Initialize A Loaded State Machine

- establish a loaded state machine
- when initializing the state machine
- should throw an invalid operation exception

### Initialize

- establish a state machine
- when state machine is initialized
- should not yet execute any entry actions

### Reinitialization

- establish an initialized state machine
- when state machine is initialized again
- should throw an invalid operation exception

### Start

- establish an initialized state machine
- when starting the state machine
- should set current state of state machine to state to which it is initialized
- should execute entry action of state to which state machine is initialized

Async Custom Types
------------------

### Custom Types For States And Events

- establish a state machine with custom types for states and events
- when using the state machine
- it should use equals to compare states and events

Async Reporting
---------------

### Report

- establish a state machine
- establish a state machine reporter
- when creating a report
- it should call the passed reporter

Sync Hierarchical Transitions
-----------------------------

### Common Ancestor

- establish a hierarchical state machine
- when firing an event resulting in a transition with a common ancestor
- the state machine should remain inside common ancestor state

### No Common Ancestor

- establish a hierarchical state machine
- when firing an event resulting in a transition without a common ancestor
- it should execute exit action of source state
- it should execute exit action of parents of source state (recursively)
- it should execute entry action of parents of destination state (recursively)
- it should execute entry action of destination state
- it should execute actions from source upwards and then downwards to destination state

Async Exception Handling
------------------------

### Exit Action Exception

- establish an exit action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Transition Action Exception

- establish a transition action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Initialization Exception

- establish a entry action for the initial state that throws an exception
- when initializing the state machine
- should catch exception and fire transition exception event
- should pass thrown exception to event arguments of transition exception event

### No Exception Handler Registered

- establish an exception throwing state machine without a registered exception handler
- when an exception occurs
- should (re-)throw exception

### Guard Exception

- establish a guard throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Entry Action Exception

- establish an entry action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

Sync State Machine Extensions
-----------------------------

### Adding Extensions

- establish a state machine
- when adding an extension
- it should notify extension about internal events

### Clearing Extensions

- establish a state machine with an extension
- when clearing all extensions from the state machine
- it should not anymore notify extension about internal events

Sync Hierarchical State Machine Initialization
----------------------------------------------

### Initialization In Leaf State

- (Background) establish a hierarchical state machine
- when initializing to a leaf state and starting the state machine
- it should set current state of state machine to state to which it is initialized
- it should execute entry action of state to which state machine is initialized
- it should execute entry action of super states of the state to which state machine is initialized

### Initialization In Super State

- (Background) establish a hierarchical state machine
- when initializing to a super state and starting the state machine
- it should_set_current_state_of_state_machine_to_initial_leaf_state_of_the_state_to_which_it_is_initialized
- it should_execute_entry_action_of_super_state_to_which_state_machine_is_initialized
- it should_execute_entry_actions_of_initial_sub_states_until_a_leaf_state_is_reached

Async Exit Actions
------------------

### Event Argument

- establish a state machine with an exit action taking an event argument
- when leaving the state
- it should pass event argument to exit action

### Exit Action With Parameter

- establish a state machine with exit action with parameter on a state
- when leaving the state
- it should execute the synchronous exit action
- it should pass parameter to the synchronous exit action
- it should execute the asynchronous exit action
- it should pass parameter to the asynchronous exit action

### Exception Handling

- establish a state machine with several exit actions on a state and some of them throw an exception
- when entering the state
- it should execute all entry actions on entry
- it should handle all exceptions of all throwing entry actions by firing the TransitionExceptionThrown event

### Multiple Exit Actions

- establish a state machine with several exit actions on a state
- when leaving the state
- it should execute all exit actions

### Exit Action

- establish a state machine with exit action on a state
- when leaving the state
- it should execute the synchronous exit action
- it should execute the asynchronous exit action

Sync Exception Handling
-----------------------

### Guard Exception

- establish a guard throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### No Exception Handler Registered

- establish an exception throwing state machine without a registered exception handler
- when an exception occurs
- should (re-)throw exception

### Exit Action Exception

- establish an exit action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Entry Action Exception

- establish an entry action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Transition Action Exception

- establish a transition action throwing an exception
- when executing the transition
- should catch exception and fire transition exception event
- should pass source state of failing transition to event arguments of transition exception event
- should pass event id causing transition to event arguments of transition exception event
- should pass thrown exception to event arguments of transition exception event
- should pass event parameter to event argument of transition exception event

### Initialization Exception

- establish a entry action for the initial state that throws an exception
- when initializing the state machine
- should catch exception and fire transition exception event
- should pass thrown exception to event arguments of transition exception event

Async Persisting
----------------

### Loading

- establish a saved state machine with history
- when state machine is loaded
- it should reset current state
- it should reset all history states of super states

### Loading An Initialized State Machine

- establish an initialized state machine
- when state machine is loaded
- it should throw invalid operation exception

Sync Start Stop
---------------

### Starting

- (Background) establish initialized state machine
- establish some queued events
- when starting
- it should execute queued events

### Stopping

- (Background) establish initialized state machine
- establish started state machine
- when stopping a state machine
- when firing events onto the state machine
- it should queue events

Sync Active State Machines
--------------------------

### Default State Machine Name

- establish an instantiated active state machine
- establish a state machine reporter
- when the state machine report is generated
- it should use the type of the state machine as name for state machine

### Events Queueing

- establish an active state machine with transitions
- when firing an event onto the state machine
- it should queue event at the end

### Custom Factory

- establish a custom factory
- when creating an active state machine
- it should use custom factory to create internal instances

### Priority Events Queueing

- establish an active state machine with transitions
- when firing a priority event onto the state machine
- it should queue event at the front

### Custom State Machine Name

- establish an instantiated active state machine with custom name
- establish a state machine reporter
- when the state machine report is generated
- it should use custom name for state machine

Sync Guards
-----------

### Otherwise Guard

- establish a state machine with otherwise guard and no machting other guard
- when an event is fired
- it should_take_transition_guarded_with_otherwise

### Matching Guard

- establish a state machine with guarded transitions
- when an event is fired
- it should take transition guarded with first matching guard

### No Matching Guard

- establish state machine with no matching guard
- when an event is fired
- it should notify about declined transition

Sync Persisting
---------------

### Loading

- establish a saved state machine with history
- when state machine is loaded
- it should reset current state
- it should reset all history states of super states

### Loading An Initialized State Machine

- establish an initialized state machine
- when state machine is loaded
- it should throw invalid operation exception

Sync Custom Types
-----------------

### Custom Types For States And Events

- establish a state machine with custom types for states and events
- when using the state machine
- it should use equals to compare states and events

Async Hierarchical State Machine Initialization
-----------------------------------------------

### Initialization In Super State

- (Background) establish a hierarchical state machine
- when initializing to a super state and starting the state machine
- it should_set_current_state_of_state_machine_to_initial_leaf_state_of_the_state_to_which_it_is_initialized
- it should_execute_entry_action_of_super_state_to_which_state_machine_is_initialized
- it should_execute_entry_actions_of_initial_sub_states_until_a_leaf_state_is_reached

### Initialization In Leaf State

- (Background) establish a hierarchical state machine
- when initializing to a leaf state and starting the state machine
- it should set current state of state machine to state to which it is initialized
- it should execute entry action of state to which state machine is initialized
- it should execute entry action of super states of the state to which state machine is initialized

Sync Entry Actions
------------------

### Entry Action

- establish a state machine with entry action on a state
- when entering the state
- it should execute the entry action

### Exception Handling

- establish a state machine with several entry actions on a state and some of them throw an exception
- when entering the state
- it should execute all entry actions on entry
- it should handle all exceptions of all throwing entry actions by firing the TransitionExceptionThrown event

### Entry Action With Parameter

- establish a state machine with entry action with parameter on a state
- when entering the state
- it should execute the entry action
- it should pass parameter to the entry action

### Multiple Entry Actions

- establish a state machine with several entry actions on a state
- when entering the state
- It should execute all entry actions

### Event Argument

- establish a state machine with an entry action taking an event argument
- when entering the state
- it should pass event argument to entry action

Sync Exit Actions
-----------------

### Event Argument

- establish a state machine with an exit action taking an event argument
- when leaving the state
- it should pass event argument to exit action

### Multiple Exit Actions

- establish a state machine with several exit actions on a state
- when leaving the state
- It should execute all exit actions

### Exit Action With Parameter

- establish a state machine with exit action with parameter on a state
- when leaving the state
- it should execute the exit action
- it should pass parameter to the exit action

### Exception Handling

- establish a state machine with several exit actions on a state and some of them throw an exception
- when entering the state
- it should execute all entry actions on entry
- it should handle all exceptions of all throwing entry actions by firing the TransitionExceptionThrown event

### Exit Action

- establish a state machine with exit action on a state
- when leaving the state
- it should execute the exit action

Async Entry Actions
-------------------

### Entry Action

- establish a state machine with entry action on a state
- when entering the state
- it should execute the synchronous entry action
- it should execute the asynchronous entry action

### Exception Handling

- establish a state machine with several entry actions on a state and some of them throw an exception
- when entering the state
- it should execute all entry actions on entry
- it should handle all exceptions of all throwing entry actions by firing the TransitionExceptionThrown event

### Entry Action With Parameter

- establish a state machine with entry action with parameter on a state
- when entering the state
- it should execute the entry synchronous action
- it should pass parameter to the synchronous entry action
- it should execute the asynchronous entry action
- it should pass parameter to the asynchronous entry action

### Event Argument

- establish a state machine with an entry action taking an event argument
- when entering the state
- it should pass event argument to synchronousentry action
- it should pass event argument to asynchronous entry action

### Multiple Entry Actions

- establish a state machine with several entry actions on a state
- when entering the state
- it should execute all entry actions

Async Transitions
-----------------

### Executing Transition

- establish a state machine with transitions
- when firing an event onto the state machine
- it should execute transition by switching state
- it should execute synchronous transition actions
- it should execute asynchronous transition actions
- it should pass parameters to transition action
- it should execute synchronous exit action of source state
- it should execute asynchronous exit action of source state
- it should execute synchronous entry action of destination state
- it should execute asynchronous entry action of destination state

Async Async Passive State Machines
----------------------------------

### Priority Events Queueing

- establish a passive state machine with transitions
- when firing a priority event onto the state machine
- it should queue event at the front

### Custom Factory

- establish a custom factory
- when creating a passive state machine
- it should use custom factory to create internal instances

### Custom State Machine Name

- establish an instantiated passive state machine with custom name
- establish a state machine reporter
- when the state machine report is generated
- it should use custom name for the state machine

### Events Queueing

- establish a passive state machine with transitions
- when firing an event onto the state machine
- it should queue event at the end

### Default State Machine Name

- establish an instantiated passive state machine
- establish a state machine reporter
- when the state machine report is generated
- it should use the type of the state machine as name for state machine
