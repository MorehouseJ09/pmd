@announce
Feature: stop
  Scenario: daemon running
    When I run `pmd stop`
    #Then a file named "/tmp/pmd/process" should exist

  Scenario: daemon not running
    #Given an empty file 

